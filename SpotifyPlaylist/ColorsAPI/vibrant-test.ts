import Vibrant from "node-vibrant";


async function main() {
    let vibrant = new Vibrant("https://i.scdn.co/image/ab67706f000000031889956ba0f579beaed6ab76");
    let palette = await vibrant.getPalette();
    console.log(palette.Vibrant!.hex);
    console.log(palette.Vibrant!.rgb);
}

main();
