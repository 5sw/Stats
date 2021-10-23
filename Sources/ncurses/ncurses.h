#define _XOPEN_SOURCE_EXTENDED 1
#define NCURSES_WGETCH_EVENTS 1
#define NCURSES_OPAQUE 0
#import <curses.h>

static inline int GetWch(WINDOW *window, wint_t *value) {
    return wget_wch(window, value);
}

static inline void Print(int w, int h) {
    mvwprintw(stdscr, 1, 1, "%d / %d", h, w);
}

