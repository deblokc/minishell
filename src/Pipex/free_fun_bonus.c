/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   free_fun_bonus.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ghanquer <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/07 14:34:08 by ghanquer          #+#    #+#             */
/*   Updated: 2022/05/13 12:35:22 by ghanquer         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/MinusculeCoquille.h"

void	free_func(t_struct *pipex)
{
	int	i;

	i = -1;
	if (pipex->envpathcut)
		if (pipex->envpathcut[i + 1])
			while (pipex->envpathcut[++i])
				free(pipex->envpathcut[i]);
	if (pipex->envpathcut)
		free(pipex->envpathcut);
	if (pipex->pid_tab)
		free(pipex->pid_tab);
}

void	error_func(t_struct *pipex, char *msg, char *cmd)
{
	(void)pipex;
	if (msg)
		ft_putstr_fd(msg, 2);
	if (cmd)
		ft_putstr_fd(cmd, 2);
	exit(127);
}
