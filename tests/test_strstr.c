/*
** EPITECH PROJECT, 2021
** ${FOLDER_NAME}
** File description:
** test_rindex.c file
*/

#include <criterion/criterion.h>

Test(strstr, base)
{
    char *str = strdup("test");
    cr_assert(strstr(str, "st") == &str[2]);
    free(str);
}
