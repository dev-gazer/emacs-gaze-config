(require 'package)
(setq package-enable-at-startup nil)
;;(require 'renpy)
;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives

             '("melpa" . "http://melpa.org/packages/") t)
;; Initializes the package infrastructure
(package-initialize)
;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))
;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    material-theme                  ;; Theme
    )
  )
;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
   (unless (package-installed-p package)
            (package-install package)))
      myPackages)
;; ===================================
;; Basic Customization
;; ===================================
(setq inhibit-startup-message t)    ;; Hide the startup message
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(set-face-attribute 'default nil :height 130)

;; User-Defined init.el ends here
(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (progn
    (which-key-setup-side-window-right-bottom)
    (which-key-mode)
    ))

(use-package awesome-tab
  :load-path "awesome-tab"
  :config
  (awesome-tab-mode t))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
  :bind (("C-\\" . 'neotree-toggle)))
(setq-default neo-show-hidden-files t)

(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))

(use-package ergoemacs-mode
  :ensure t
  :config
  (progn
    (setq ergoemacs-theme nil)
    (setq ergoemacs-keyboard-layout "us")
    (ergoemacs-mode 1)))

(use-package rebecca-theme
  :ensure t
  :init (load-theme 'rebecca t))
;;(load-theme 'misterioso)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t))

(use-package tabbar-ruler
  :ensure t
  :config
  (progn
    (setq tabbar-ruler-global-tabbar t)
    )
  )


;;(require 'renpy)

(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (renpy flycheck rebecca-theme ergoemacs-mode ace-window neotree auto-complete which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
