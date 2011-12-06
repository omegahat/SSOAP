(defun xfun 
  ( name to )
   "" 
  (interactive)
  (while (search-forward (concat "\\" name "{") nil t)
     (replace-match (concat "<r:" to ">") t t)
     (re-search-forward "}" nil t)
     (replace-match (concat "</r:" to ">") t t))
)