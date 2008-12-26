;;; bindings.el --- Set up of key bindings

;; Go to line.
(global-set-key (kbd "M-g") 'goto-line)

;; Copy region to clippboard.
(global-set-key (kbd "C-x M-w") 'clipboard-kill-ring-save)

;; Newline and then indent.
(global-set-key (kbd "RET") 'reindent-then-newline-and-indent)

;; Open line below and go to that line.
(global-set-key (kbd "M-n") 'open-line-below)

;; Open line above and go to that line.
(global-set-key (kbd "M-p") 'open-line-above)

;; Toggle ECB show and hide.
(global-set-key (kbd "�") 'ecb-toggle-ecb-windows)

;; Indent region or buffer.
(global-set-key (kbd "C-S-f") 'indent-buffer-or-region)

;; Back to indentation or beginning of line.
(global-set-key (kbd "C-a") 'back-to-indentation-or-beginning-of-line)

;; Delete work backwards without saving it to the kill ring.
(global-set-key (kbd "<M-backspace>") 'backward-delete-word)

;; Google region.
(global-set-key (kbd "C-c C-c g") 'google-region)

;; Comments or uncomments a line or region
(global-set-key (kbd "C-7") 'comment-or-uncomment-whole-lines-or-region)

;; Moves region to *scratch* buffer.
(global-set-key (kbd "C-c s") 'copy-region-to-scratch-buffer)

;; Moves line or region one line down.
(global-set-key (kbd "<C-M-down>") 'drag-line-or-region-down)

;; Moves line or region one line up.
(global-set-key (kbd "<C-M-up>") 'drag-line-or-region-up)

;; Show occurances of regexp.
(global-set-key (kbd "C-o") 'occur)

;; Toggle line numbers.
(global-set-key (kbd "<f6>") 'linum-mode)

;; Magit status.
(global-set-key (kbd "C-x g") 'magit-status)

;; So that Emacs never is quit by mistake.
(global-set-key (kbd "C-x C-c")
                (lambda ()
                  (interactive)
                  (if (y-or-n-p "Quit Emacs? ")
                      (save-buffers-kill-emacs))))

;; Perform general cleanup of buffer.
(global-set-key (kbd "C-c n")
                (lambda ()
                  (interactive)
                  (untabify-buffer)
                  (delete-trailing-whitespace)
                  (indent-buffer)))

(provide 'bindings)