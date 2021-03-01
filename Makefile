##
## EPITECH PROJECT, 2019
## base_repo
## File description:
## Makefile file
##


SRC				=		src/memcpy.s 		\
  						src/memmove.s  		\
  						src/memset.s		\
  						src/rindex.s		\
  						src/strcasecmp.s	\
  						src/strchr.s		\
  						src/strcmp.s  		\
  						src/strcspn.s		\
  						src/strlen.s  		\
  						src/strncmp.s  		\
  						src/strpbrk.s		\
  						src/strstr.s


BUILDDIR		=    	build

override OBJ	=		$(SRC:%.s=$(BUILDDIR)/%.o)

TRC				=		tests/test_rindex.c	\
						tests/test_strlen.c	\
						tests/test_strchr.c

OTRC			=		$(TRC:%.c=%.o)

#CFLAGS			=		-Wall -Werror -Wextra -std=gnu99

ASFLAGS			=		-f elf64

#CPPFLAGS		=		-Iinclude

AS				=		nasm

NAME			=		 libasm.so

LDFLAGS			=		-shared #-Wl,-soname,$(NAME)

CC				=		ld

all: $(NAME) ## hoes mad

$(NAME): $(OBJ)
	$(LINK.o) $^ $(LDLIBS) $(OUTPUT_OPTION)

.SECONDEXPANSION:
#$(BUILDDIR)/%.o:    override CPPFLAGS += -MT $@ -MMD -MP -MF $(@:.o=.d)
$(BUILDDIR)/%.o:	%.s | $$(@D)/.
	$(COMPILE.s) $(OUTPUT_OPTION) $<

$(BUILDDIR)/.:
	mkdir $@

$(BUILDDIR)%/.:
	mkdir -p $@

.PRECIOUS:            $(BUILDDIR)/. $(BUILDDIR)%/.

clean: ## rm build obj
	$(RM) -r $(BUILDDIR)

fclean:	clean ## clean + rm $(NAME)
	rm -rf $(NAME)

gclean:	fclean clean ## ?

re: gclean all ## Re

tests_run:	$(NAME) $(OTRC) ## Run Tests
	gcc -o unit_test $(OTRC) -lcriterion --coverage
	LD_PRELOAD=./$(NAME) ./unit_test

help:                                                        ##
		@
		@grep -E "^[a-zA-Z\\_]+:.*## " Makefile | awk 'BEGIN {FS = ":.*## "}; {

.PHONY:			gclean clean fclean re tests_run all help
