int ft_strlen(char *);
char *ft_strcpy(char *, char *);
int  ft_strcmp(char *, char *);
int ft_write(int, const void*, int);

int main(void)
{
    char *str = "";
    char *dest;
    char *s1 = "hyy";
    char *s2 = "hyy";
    int len;
    len = ft_strlen(str);
    dest = malloc(sizeof(char ) * (len + 1));
    
    printf("STRLEN = [%d]\n", ft_strlen(str));
    printf("STRCOPY = [%s]\n", ft_strcpy(dest, str));
    printf("WRITE = [%c]\n", ft_write(1, "h", 1));
  //  printf("STRCMP = [%d]\n", ft_strcmp(s1, s2));

    return (0);
}