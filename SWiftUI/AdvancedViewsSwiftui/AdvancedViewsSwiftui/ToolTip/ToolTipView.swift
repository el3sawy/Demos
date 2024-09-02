//

import SwiftUI
import Combine

final class CurrentTooltip: ObservableObject {
    @Published var current: Namespace.ID?
}

@propertyWrapper
struct TooltipState: DynamicProperty {
    @Namespace private var id
    @EnvironmentObject private var state: CurrentTooltip

    var wrappedValue: Bool {
        get { state.current == id }
        nonmutating set {
            if newValue {
                print(id)
                state.current = id
            } else {
                if state.current == id {
                    state.current = nil
                }
            }
        }
    }

    init() { }
}

struct TooltipModifier<TooltipContent: View>: ViewModifier {
    var tooltipContent: TooltipContent
    @TooltipState private var isShowing

    func body(content: Content) -> some View {
        content
            .onTapGesture {
                isShowing.toggle()
            }
            .overlay(alignment: .top) {
                ZStack {
                    if isShowing {
                        tooltipContent
                            .padding(8)
                            .background(.regularMaterial.shadow(.drop(color: Color.primary.opacity(0.2), radius: 2)), in: .rect(cornerRadius: 4))
                            .fixedSize()
                            .font(.body)
                    }
                }
                .alignmentGuide(.top, computeValue: { dimension in
                    dimension[.bottom] + 8
                })
            }
    }
}

extension View {
    func tooltip<Other: View>(@ViewBuilder other: () -> Other) -> some View {
        modifier(TooltipModifier(tooltipContent: other()))
    }
}

struct ContentView1: View {

    var body: some View {
        HStack(spacing: 32) {
            Image(systemName: "house")
                .tooltip {
                    HStack {
                        Text("Home")
                        Circle()
                            .fill(.green)
                            .frame(width: 10, height: 10)
                    }
                }
            Image(systemName: "video")
                .tooltip {
                    HStack {
                        Text("Camera")
                        Circle()
                            .fill(.red)
                            .frame(width: 10, height: 10)
                    }
                }
            Image(systemName: "mic")
        }
        .font(.largeTitle)
        .padding(.vertical, 50)
        .frame(maxHeight: .infinity, alignment: .top)
        .modifier(TooltipHelper())
    }
}

struct TooltipHelper: ViewModifier {
    @StateObject private var current = CurrentTooltip()

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.clear
                    .contentShape(.rect)
                    .onTapGesture {
                        current.current = nil
                    }
            }
            .environmentObject(current)
    }
}

#Preview {
    ContentView1()
}
