(add-to-list 'load-path "/home/heikki/.emacs.d/")
(require 'vimpulse)
(require 'php-mode)
(vimpulse-vmap ",c" 'comment-dwim)
;(vimpulse-map (kbd "C-x C-l") 'hippie-expand)

(global-set-key "\M-/" 'hippie-expand)

;; (global-set-key [(meta f5)] (make-hippie-expand-function
;;   '(try-expand-line
;;    ) t))

(global-set-key (kbd "C-x C-l") (make-hippie-expand-function
  '(try-expand-line
   ) t))

