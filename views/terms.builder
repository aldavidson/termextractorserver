xml.instruct! :xml, :version => "1.0"
xml.terms do
for term in @terms
  xml.term do
    xml.to_s term.to_s
    xml.pos  term.pos
    xml.chunks do 
    for chunk in term.chunks
      xml.chunk chunk
    end
    end
    xml.tokens do 
    for token in term.tokens
      xml.token token
    end
    end
    xml.sentence term.sentence
  end
end
end