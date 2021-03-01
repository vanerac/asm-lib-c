/*
** EPITECH PROJECT, 2021
** ${FOLDER_NAME}
** File description:
** test_strlen.c file
*/


#include <criterion/criterion.h>

Test(strlen, base)
{
    char *str = strdup("test");
    cr_assert(strlen(str) == 4);
    free(str);
}

Test(rindex, null)
{
    char *str = strdup("test");
    cr_assert(strlen(NULL) == 0);
    free(str);
}