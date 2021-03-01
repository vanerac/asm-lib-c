/*
** EPITECH PROJECT, 2021
** ${FOLDER_NAME}
** File description:
** test_strlen.c file
*/


#include <criterion/criterion.h>

Test(strchr, base)
{
    char *str = strdup("test");
    cr_assert(strchr(str, 't') == str);
    free(str);
}

Test(strchr, not_found)
{
char *str = strdup("test");
cr_assert(strchr(str, 'o') == NULL);
free(str);
}

Test(strchr, null)
{
    char *str = strdup("test");
    cr_assert(strchr(NULL, 'a') == NULL);
    free(str);
}