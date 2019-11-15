package br.edu.les2019.strategy;

import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Video;

public class ValidadorVideo extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	Video video = (Video)ed;
		if(!video.getLink().contains("<iframe") && 
			!video.getLink().contains("</iframe>"))
		{return video.getLink() + " não caracteriza um iframe";}
		
		if(video.getTime() > 90.0)
		{return "Este vídeo está muito longo";}
		
		return null;
	}
}