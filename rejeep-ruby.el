;;; rejeep-ruby.el --- Ruby specific settings

(require 'rvm)
(require 'ruby-end)
(require 'ruby-block)
(require 'rspec-mode)

(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)

(setq rspec-use-rvm t)
(setq rspec-use-rake-flag nil)

(add-hook 'ruby-mode-hook 'paredit-mode)
(add-hook 'ruby-mode-hook 'rspec-mode)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'rvm-activate-corresponding-ruby)
(add-hook 'ruby-mode-hook
          (lambda()
            (setq ruby-deep-indent-paren nil)
            (setq ruby-end-check-statement-modifiers t)
            
            (define-key ruby-mode-map (kbd "C-M-n") 'scroll-up-five)
            (define-key ruby-mode-map (kbd "C-M-p") 'scroll-down-five)))


(dolist (regex '("\\.rake$" "\\.gemspec$" "\\.ru$" "Rakefile$" "Gemfile$" "Capfile$"))
  (add-to-list 'auto-mode-alist `(,regex . ruby-mode)))

(provide 'rejeep-ruby)
