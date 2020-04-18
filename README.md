# How to use
This is intended to be used with [GNU Stow](https://www.gnu.org/software/stow/).
Simply clone the repository and use stow to symlink whichever configs that you want.

Example:
```bash
stow $PACKAGE_NAME --target=$HOME
```
where 
```$PAKCAGE_NAME``` 
is whatever config you want to install.
This will symlink any contents of the 
```$PACKAGE_NAME``` 
package to the ```$HOME``` directory. 

