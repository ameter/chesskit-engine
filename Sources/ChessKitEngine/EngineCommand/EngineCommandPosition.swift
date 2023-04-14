//
//  EngineCommandPosition.swift
//  ChessKitEngine
//

public extension EngineCommand {
    
    /// Possible positions that can be passed to
    /// `EngineCommand.position`.
    enum PositionString: RawRepresentable {
        /// Any FEN position, given in the provided `String`.
        case fen(String)
        /// The starting position.
        case startpos
        
        public var rawValue: String {
            switch self {
            case .fen(let string):
                return "fen \(string)"
            case .startpos:
                return "startpos"
            }
        }
        
        public init?(rawValue: String) {
            if rawValue == "startpos" {
                self = .startpos
            } else if rawValue.starts(with: "fen") {
                let tokens = rawValue.components(separatedBy: " ")
                guard tokens.count == 2 else { return nil }
                self = .fen(tokens[1])
            } else {
                return nil
            }
        }
    }
}