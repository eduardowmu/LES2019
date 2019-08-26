package br.edu.les2019.command;

import br.edu.les2019.facade.Facade;
import br.edu.les2019.facade.IFacade;

public abstract class AbstractCommand implements ICommand
{IFacade facade = new Facade();}
