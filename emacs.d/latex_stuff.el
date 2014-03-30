;; LaTex ==> For GNU Emacs, the recommended way to activate AUCTeX and
;;preview-latex is to add the ==> following lines to your ~/.emacs
;;file:
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)


(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode

(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode

;; To integrate RefTeX with AUCTeX
(setq reftex-plug-into-AUCTeX t)


;;https://www.gnu.org/software/auctex/manual/auctex/Parsing-Files.html
(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-auto-save t) ; Enable parse on save.

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

;; (setq TeX-PDF-mode t)





;; configure LaTeX to outpud pdf files instead of dvi
;; http://www.znasibov.info/posts/emacs-latex-and-pdf-viewer.html
;; (setq TeX-PDF-mode t)
;; TODO :: is there not a way to force latex output ps

;; TODO :: make xpdf the default viewer for pdfs produced by emacs

;; TODO :: if one uses the C-c C-c command in auctex then i want to
;; automatically run C-c C-c bibtex after it

;; TODO
;; http://www.hermann-uwe.de/blog/faster-and-more-comfortable-latex-editing-and-previewing-with-latexmk

;; http://www.emacswiki.org/emacs/InverseDviSearch
(setq TeX-source-correlate-method 'source-specials)  ;; auctex 10.86  
(setq TeX-source-correlate-mode 1)   
