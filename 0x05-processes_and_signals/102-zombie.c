#include <stdio.h>
#include <unistd.h>

int infinite_while(void);

/**
 * main - creates five zombie processes.
 *
 * Return: nothing.
 */
int main(void)
{
	int i;
	pid_t pid;

	for (i = 0; i < 5; i++)
	{
		pid = fork();

		if (pid > 0)
		{
			printf("Zombie process created, PID: %d\n", pid);
			infinite_while();
		}
		else
			continue;
	}
}

/**
 * infinite_while - infinite loop
 *
 * Return: nothing.
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}
