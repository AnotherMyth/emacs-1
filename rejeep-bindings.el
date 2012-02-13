;;; rejeep-bindings.el --- Set up of key bindings

(defun global-set-keys (bindings)
  "Globally set all BINDINGS."
  (dolist (binding bindings)
    (let ((key (car binding)) (command (cadr binding)))
      (global-set-key (read-kbd-macro key) command))))

(global-set-keys
 '(("M-g" goto-line)
   ("C-x M-w" clipboard-kill-ring-save)
   ("M-n" open-line-below)
   ("M-p" open-line-above)
   ("C-a" back-to-indentation-or-beginning-of-line)
   ("C-c g" google)
   ("C-7" comment-or-uncomment-current-line-or-region)
   ("C-o" occur)
   ("C-6" linum-mode)
   ("C-x g" magit-status)
   ("%" match-paren)
   ("C-c d" duplicate-current-line-or-region)
   ("C-c +" text-scale-increase)
   ("C-c -" text-scale-decrease)
   ("C-c n" clean-up-buffer-or-region)
   ("C-c s" swap-windows)
   ("C-c r" rename-this-buffer-and-file)
   ("C-c k" delete-this-buffer-and-file)
   ("C-0" join-line-or-lines-in-region)
   ("M-z" zap-up-to-char)
   ("C-M-p" scroll-down-five)
   ("C-M-n" scroll-up-five)
   ("M-k" kill-this-buffer)
   ("M-o" other-window)
   ("C-x C-c"
    (lambda ()
      (interactive)
      (if (y-or-n-p "Quit Emacs? ")
          (save-buffers-kill-emacs))))
   ("C-8"
    (lambda ()
      (interactive)
      (find-file
       (expand-file-name "init.el" emacs-dir))))))

(provide 'rejeep-bindings)
