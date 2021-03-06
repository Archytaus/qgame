/*
** mrbtest - Test for Embeddable Ruby
**
** This program runs Ruby test programs in test/t directory
** against the current mruby implementation.
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <mruby.h>
#include <mruby/proc.h>
#include <mruby/data.h>
#include <mruby/compile.h>
#include <mruby/variable.h>
#include <mruby/array.h>

#include <SDL2/SDL_main.h>

void 
mrb_init_gamelib(mrb_state *);

void 
mrb_init_qgamelib(mrb_state *);

void
mrb_init_application(mrb_state *);

void
qgame_init(mrb_state *);

void 
mrb_init_mrbgems(mrb_state *);

void 
mrb_init_qgamegems(mrb_state *);

void 
mrb_init_gamegems(mrb_state *);

void
mrb_mruby_freetypegl_gem_init(mrb_state*);

int
main(int argc, char **argv)
{
  mrb_state *mrb;

  /* new interpreter instance */
  mrb = mrb_open();
  if (mrb == NULL) {
    fprintf(stderr, "Invalid mrb_state, exiting test driver");
    return EXIT_FAILURE;
  }
  
  mrb_value ARGV = mrb_ary_new_capa(mrb, argc);
  for (int i = 0; i < argc; i++) {
   mrb_ary_push(mrb, ARGV, mrb_str_new(mrb, argv[i], strlen(argv[i])));
  }
  mrb_define_global_const(mrb, "ARGV", ARGV);

  mrb_init_mrbgems(mrb);
  
  qgame_init(mrb);
  mrb_init_qgamelib(mrb);
  mrb_init_qgamegems(mrb);
  
  mrb_init_gamegems(mrb);
  mrb_init_gamelib(mrb);
  
  mrb_init_application(mrb);

  mrb_close(mrb);

  return EXIT_SUCCESS;
}
