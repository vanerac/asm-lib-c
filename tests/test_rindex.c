/*
** EPITECH PROJECT, 2021
** ${FOLDER_NAME}
** File description:
** test_rindex.c file
*/

#include <criterion/criterion.h>

Test(rindex, base)
{
    char *str = strdup("test");
    cr_assert(rindex(str, 't') == &str[3]);
    free(str);
}

Test(rindex, not_found)
{
    char *str = strdup("test");
    cr_assert(rindex(str, 'o') == NULL);
    free(str);
}