import SwiftUI

struct ContentView: View {
    @State private var firstNumber: String = ""
    @State private var secondNumber: String = ""
    @State private var result: Int? = nil
    @State private var selectedOperation = 0 // 選択された演算子
    
    let operations = ["＋", "−", "×", "÷"]
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer() // 上に余白を追加
            
            // 入力フィールドと演算子のピッカーを横並びに
            HStack {
                TextField("Enter first number", text: $firstNumber)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Picker("", selection: $selectedOperation) {
                    ForEach(0..<operations.count) { index in
                        Text(operations[index])
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 50)
                
                TextField("Enter second number", text: $secondNumber)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            .frame(maxWidth: .infinity) // 横幅を可能な限り広げることで中央寄せ
            
            // 計算ボタン
            Button(action: {
                if let firstNum = Int(firstNumber), let secondNum = Int(secondNumber) {
                    result = calculate(firstNum, secondNum, operation: operations[selectedOperation])
                } else {
                    result = nil
                }
            }) {
                Text("calculate")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            // 結果の表示
            if let result = result {
                Text("結果: \(result)")
                    .font(.title)
                    .padding()
            } else {
                Text("")
                    .foregroundColor(.red)
                    .padding()
            }
            
            Spacer() // 下に余白を追加
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity) // 画面全体に広げる
        .background(Color(.systemGray6)) // 背景色を追加（オプション）
    }
    
    // 計算関数
    func calculate(_ firstNum: Int, _ secondNum: Int, operation: String) -> Int? {
        switch operation {
        case "＋":
            return firstNum + secondNum
        case "−":
            return firstNum - secondNum
        case "×":
            return firstNum * secondNum
        case "÷":
            return secondNum != 0 ? firstNum / secondNum : nil
        default:
            return nil
        }
    }
}

