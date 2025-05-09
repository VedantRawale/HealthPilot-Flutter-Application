require('dotenv').config();

const getRecommendedTests = async (symptoms) => {
    try {
        const response = await fetch('http://127.0.0.1:11434/api/generate', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                model: "llama3.2",
                prompt: `You are a medical assistant. Based on the following symptoms, suggest a list of recommended lab tests in a clean bullet-point format.

                        Symptoms: ${symptoms}

                        Format:
                        1. <Test Name>: <Short Reason>
                        2. ...
                        Avoid repeating tests. Be clear and concise.`,
                stream: false
            }),
        });

        if (!response.ok) {
            throw new Error(`Network error: ${response.statusText}`);
        }

        const data = await response.json();
        console.log("Ollama raw response:", data); 
        return data.response;
    } catch (error) {
        console.error("Error fetching recommended tests:", error);
        throw error;
    }
};

exports.suggestTest = async (req, res) => {
    const { symptoms } = req.body;
    if (!symptoms || typeof symptoms !== 'string') {
        return res.status(400).json({ message: "Please provide valid symptoms" });
    }

    try {
        const responseText = await getRecommendedTests(symptoms.trim());
        console.log("LLM Response Text:", responseText);

        const testsArray = responseText.split(",").map(test => test.trim());

        if (!testsArray.length) {
            return res.status(404).json({ message: "No tests found for the provided symptoms" });
        }

        res.status(200).json({
            message: "Recommended tests",
            tests: testsArray,
        });
    } catch (error) {
        res.status(500).json({ message: "Failed to suggest tests", error: error.message });
    }
};
