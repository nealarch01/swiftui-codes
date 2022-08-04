import Foundation


func main() {
    let hexStr: String = "0x191414"
    let hex = 0x191414
    let convertedHex = Int(hexStr)
    print(convertedHex ?? "Could not convert hex string to int.")
    print(hex)
}

main()