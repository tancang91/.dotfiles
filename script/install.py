import platform
import subprocess

# {{{
class Color:
    RED     = '\033[38;5;196m'
    GREEN   = '\033[38;5;10m'
    BLUE    = '\033[38;5;33m'
    MAGENTA = '\033[38;5;13m'
    YELLOW  = '\033[38;5;11m'
    RESET   = '\033[0m'

    @classmethod
    def red(cls, text: str):
        return f'{cls.RED}{text}{cls.RESET}'

    @classmethod
    def green(cls, text: str):
        return f'{cls.GREEN}{text}{cls.RESET}'

    @classmethod
    def blue(cls, text: str):
        return f'{cls.BLUE}{text}{cls.RESET}'

    @classmethod
    def magenta(cls, text: str):
        return f'{cls.MAGENTA}{text}{cls.RESET}'

    @classmethod
    def yellow(cls, text: str):
        return f'{cls.YELLOW}{text}{cls.RESET}'

def get_installed_packs(cmd: str) -> set:
    if 'brew' == cmd:
        cmd_line = 'brew list --formula'
    elif 'brew cask' == cmd:
        cmd_line = 'brew list --cask'
    else: return set()

    try:
        res = subprocess.run(cmd_line, shell=True, stdout=subprocess.PIPE)
        if res.returncode == 0:
            str_ = res.stdout.decode().rstrip('\n')
            return set(str_.split('\n'))

    except subprocess.CalledProcessError:
        print(Color.red('Brew not installed'))

    return set()

def installed_pack(name: str, cmd: str, message:str = '') -> int:
    try:
        res = subprocess.run(cmd, shell=True,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.PIPE)

        if b'' == res.stderr:
            message += f"{Color.green('Success')} {name} installed"
            code = 0
        else:
            message += f"{Color.red('Failed')}  {name} unavailable"
            code = 1

    except subprocess.CalledProcessError:
        message += f"{Color.red('Error')} {name}"
        code = 2

    finally:
        print(message)
        return code

def install_packages(pm: str, packages: list):
    if 'brew' in pm:
        try:
            subprocess.run('brew update', shell=True, stdout=subprocess.DEVNULL)
        except subprocess.CalledProcessError:
            print(f'{Color.yellow("Warning")} brew not exist. Brew installation begins....')
            subprocess.run('/bin/bash -c "$(curl -fsSL \
                    https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"',
                    shell=True)
        finally:
            print('')
            print(f'{Color.green("Done")} Checking brew installed')

        if 'brew' == pm:
            print('========== brew package install ==========')
            cmd_line = 'brew install'
        elif 'brew cask' == pm:
            print('========== brew cask package install ==========')
            cmd_line = 'brew cask install'

    elif 'apt-get' == pm:
        print('\n========== apt-get package install ==========')
        cmd_line = 'sudo apt-get install'

    elif 'apt' == pm:
        print('\n========== apt package install ==========')
        cmd_line = 'sudo apt install'

    else:
        print(f'{Color.red("Error")} No support for {pm} package manager')
        print('Stop')
        return

    number_of_pack: int  = len(packages)
    installed_packs: set = get_installed_packs(pm)
    for i, p in enumerate(packages, 1):
        message = f'[{i}/{number_of_pack}]'
        message += ' ' * (8-len(message))
        if p not in installed_packs:
            if installed_pack(p, f'{cmd_line} {p}', message) == 0:
                if 'zsh' == p:
                    cmd = 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
                    installed_pack('oh-my-zh', cmd, message)

        else:
            message += f"{Color.yellow('Skipped')} {p} already installed"
            print(message)
# }}}

if __name__ == '__main__':
    system = platform.system()
    if 'Darwin' == system:
        packages_brew = [
            'bash',
            'cmake',
            'fzf',
            'ctags',
            'jq',
            'gawk',
            'go',
            'htop',
            'llvm',
            'nasm',
            'ncurses',
            'neovim',
            'ninja',
            'node',
            'postgresql',
            'python@3.8',
            'glow',
            'redis',
            'sqlite',
            'stow',
            'tmux',
            'tree',
            'vifm',
            'ripgrep',
            'wget',
            'zsh',
        ]

        packages_cask = [
            'amethyst',
            'iina',
            'iterm2',
        ]

        install_packages('brew', packages_brew)
        install_packages('brew cask', packages_cask)

    elif 'Linux' == system:
        packages = [
            'build-essential',
            'git',
            'cmake',
            'curl',
            'gcc',
            'g++'
            'jq',
            'htop',
            'neovim',
            'ninja',
            'node',
            'stow',
            'tmux',
            'tree',
            'vifm',
            'wget',
            'zsh',
        ]
        install_packages('apt-get', packages_brew)

    elif 'Windows' == system:
        print('Windows')

    else:
        print('Unspecified Operating system')
