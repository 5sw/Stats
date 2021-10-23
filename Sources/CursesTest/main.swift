//
//  File.swift
//  
//
//  Created by Sven Weidauer on 22.10.21.
//

import Foundation
import ncurses

setlocale(LC_ALL, "")
initscr()
cbreak()
nonl()
noecho()
keypad(stdscr, true)
timeout(0)

func readEvents() {
    while true {
        var wchar: wint_t = 0
        let key = GetWch(stdscr, &wchar)
        switch key {
        case ERR:
            return

        case OK:
            break

        case KEY_CODE_YES:
            switch wchar {
            case KEY_RESIZE:
                break

            case KEY_MOUSE:
                var event = MEVENT()
                getmouse(&event)

            default:
                break
            }
            break

        default:
            break
        }
    }
}



let inSource = DispatchSource.makeReadSource(fileDescriptor: STDIN_FILENO, queue: .main)
inSource.setEventHandler {
    readEvents()
}


let winchSource = DispatchSource.makeSignalSource(signal: SIGWINCH, queue: .main)
winchSource.setEventHandler {
    ungetch(KEY_RESIZE)
    readEvents()
}

inSource.resume()
winchSource.resume()


dispatchMain()
