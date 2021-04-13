#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <stddef.h>
#include <string.h>

typedef struct  s_list
{
    void    *data;
    struct  s_list  *next;
}               t_list;

int   ft_list_size(t_list *list);

static t_list   *ft_create_elem(void *data)
{
        t_list  *node;

        if (!(node = malloc(sizeof(t_list))))
                return (NULL);
        node->data = data;
        node->next = NULL;
        return (node);
}
void    list_push_front(t_list **begin_list, void *data)
{
        t_list  *node;

        if (!begin_list)
                return ;
        if (!(*begin_list))
                *begin_list = ft_create_elem(data);
        else
        {
                node = ft_create_elem(data);
                node->next = *begin_list;
                *begin_list = node;
        }
}

void    ft_free(void *ptr)
{
        if (ptr)
                free(ptr);
}

void    initialize_list(t_list **list, int index, void (*ft)())
{
        if (index == 0)
                *list = NULL;
        else if (index == 1)
        {
                *list = NULL;
                ft(list, strdup("milk"));
        }
        else if (index == 2)
        {
                *list = NULL;
                ft(list, strdup("milk"));
                ft(list, strdup("milk"));
                ft(list, strdup("milk"));
        }
        else if (index == 3)
        {
                *list = NULL;
                ft(list, strdup("apple"));
                ft(list, strdup("milk"));
                ft(list, strdup("bread"));
        }
        else if (index == 4)
        {
                *list = NULL;
                ft(list, strdup("milk"));
                ft(list, strdup("bread"));
                ft(list, strdup("milk"));
                ft(list, strdup("apple"));
                ft(list, strdup("ZEBRA"));
                ft(list, strdup("tomato"));
                ft(list, strdup("milk"));
        }
}

void    ft_list_clear(t_list *begin_list, void (*free_fct)(void *))
{
        t_list  *aux;

        if (!begin_list || !free_fct)
                return ;
        while (begin_list)
        {
                aux = begin_list;
                begin_list = begin_list->next;
                (free_fct)(aux->data);
                free(aux);
        }
        begin_list = NULL;
}

int    main(void)
{
    int             index;
    t_list  *list;

    list = NULL;
    index = 3;
    initialize_list(&list, index, list_push_front);
    printf("Numbers of lists [%d]\nYou can change the index (< 5) in the main_bonus file\n", ft_list_size(list));
    ft_list_clear(list, ft_free);
    return (0);
}