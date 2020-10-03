#define SDL_MAIN_HANDLED
#include "SDL.h"

int main(int argc, char **argv) {

    SDL_SetMainReady();
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        return 1;
    };
        
    SDL_Point window_size = {640, 480};
    
    SDL_Window *win = NULL;
    SDL_Renderer *ren = NULL;
    
    if (SDL_CreateWindowAndRenderer (
        window_size.x,
        window_size.y,
        0,
        &win,
        &ren
    ) != 0) return 1;

    SDL_bool done = SDL_FALSE;

    SDL_Event event;

    while(!done) {
        SDL_SetRenderDrawColor(ren, 153, 51, 153, SDL_ALPHA_OPAQUE);
        SDL_RenderClear(ren);
        SDL_SetRenderDrawColor(ren, 255, 255, 255, SDL_ALPHA_OPAQUE);
        SDL_RenderDrawLine(ren, 320, 200, 300, 240);
        SDL_RenderDrawLine(ren, 300, 240, 340, 240);
        SDL_RenderDrawLine(ren, 340, 240, 320, 200);
        SDL_RenderPresent(ren);

        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                done = SDL_TRUE;
            }
        }
    }

    if (ren) {
        SDL_DestroyRenderer(ren);
    }
    if (win) {
        SDL_DestroyWindow(win);
    }
    SDL_Quit();
    return 0;
}
