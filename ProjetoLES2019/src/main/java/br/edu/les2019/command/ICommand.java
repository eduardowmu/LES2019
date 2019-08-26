package br.edu.les2019.command;

import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.result.Result;

public interface ICommand 
{public abstract Result execute(EntityDomain ed);}