((text) @injection.content
 (#set! injection.language "html")
 (#set! injection.combined))

((comment) @injection.content
  (#set! injection.language "phpdoc"))

(heredoc
  (heredoc_body) @injection.content
  (heredoc_end) @injection.language)

(nowdoc
  (nowdoc_body) @injection.content
  (heredoc_end) @injection.language)
