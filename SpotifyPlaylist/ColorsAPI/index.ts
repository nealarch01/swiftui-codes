import express from "express";
import Vibrant = require('node-vibrant')

const app = express();

app.use(express.text({
    type: "application/json"
}));

app.get("/", async (req, res) => {
    return res.status(200).send({
        message: "OK"
    });
});

// Using post to accept a URL in the body
app.post("/color", async (req: express.Request, res: express.Response) => {
    // Expects: "imageURL": "https://some-url.com"
    let reqBody = JSON.parse(req.body);
    if (req.body === undefined) {
        return res.status(400).send({
            message: "No body found in request"
        });
    }

    if (reqBody.imageURL === undefined) {
        return res.status(400).send({
            message: "No url found in request body"
        });
    }
    let vibrant = new Vibrant(reqBody.imageURL);
    let palette = await vibrant.getPalette();
    let hexValue = parseInt(palette.Vibrant!.hex.replace("#", "0x"));
    return res.status(200).send({
        hexValue,
        red: palette.Vibrant!.rgb[0],
        green: palette.Vibrant!.rgb[1],
        blue: palette.Vibrant!.rgb[2],
    });
});

app.listen(5001, () => {
    console.log("http://127.0.0.1:5001");
    console.log("Server started on port 5001.");
});
