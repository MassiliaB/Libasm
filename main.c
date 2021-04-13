#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <stddef.h>
#include <string.h>

size_t ft_strlen(const char *);
ssize_t ft_write(int, const void*, size_t);
ssize_t ft_read(int, void *, size_t);
char *ft_strcpy(char *, const char *);
int  ft_strcmp(const char *, const char*);
char *ft_strdup(const char *);

int main(void)
{
    const char *hola = "hola";
    const char *chocolat = "chocolat";
    const char *fourty = "42";
    char *buff;
    int len;

//---------------FT_STRLEN--------
    printf("----------STRLEN---------\n");
    printf("hola = [%zu]\n", ft_strlen(hola));
    printf("chocolat = [%zu]\n", ft_strlen(chocolat));
    printf("42 = [%zu]\n", ft_strlen(fourty));
//---------------FT_STRCPY--------
    printf("----------COPY---------\n");
    len = ft_strlen(hola);
    buff = malloc(sizeof(char ) * (len + 1));
    printf("hola = [%s]\n", ft_strcpy(buff, hola));
    free(buff);
    len = ft_strlen(chocolat);
    buff = malloc(sizeof(char ) * (len + 1));
    printf("chocolat = [%s]\n", ft_strcpy(buff, chocolat));
    free(buff);
    len = ft_strlen(fourty);
    buff = malloc(sizeof(char ) * (len + 1));
    printf("42 = [%s]\n", ft_strcpy(buff, fourty));
    free(buff);
//---------------FT_STRDUP--------
    printf("----------DUP---------\n");
    printf("hola = [%s]\n", ft_strdup(hola));
    printf("chocolat = [%s]\n", ft_strdup(chocolat));
    printf("42 = [%s]\n", ft_strdup(fourty));
//---------------FT_STRCOMP--------
    printf("----------STRCMP---------\n");
   printf("TEST = [%d]\n", ft_strcmp("\xff", "\x02"));
    printf("hola / hola = [%d]\n", ft_strcmp(hola, hola));
    printf("hola / 42 = [%d]\n", ft_strcmp(fourty, hola));
    printf("a / z = [%d]\n", ft_strcmp("a", "z"));
//---------------FT_WRITE--------       
    printf("----------WRITE---------\n");
    ft_write(1, "c", 1);
    ft_write(1, "\n", 1);
    ft_write(1, "j", 1);
    ft_write(1, "\n", 1);
    ft_write(1, "a", 1);
    ft_write(1, "\n", 1);
//---------------FT_READ--------  
    printf("----------READ---------\n");
    char buff1[400];
    int ret;
    int fd;

    fd = open("test.txt", O_RDONLY);
    ret = ft_read(fd, buff1, 400);
    buff1[ret] = 0;
    printf("%d characters and the content :\n%s", ret, buff1);
    close(fd);
    return (0);
}