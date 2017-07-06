module ApplicationHelper
	# Returns the full title on a per-page basis.
	def full_title(page_title = '')                   #questo metodo fa sì che metto la "|" nel titolo della pagina solo se è presente una titolo della view            
		base_title = "Recipely"						  # page_title=' ' è un argomento di default, ossia se non gli passi page_title prende come argomento un string vuota
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end
end
