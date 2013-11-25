module ApplicationHelper
	def markdown
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, tables: true, autolink: true, lax_spacing: true, highlight: true, quote: true)
	end
end
