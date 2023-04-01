Vagrant.configure('2') do |config|
  config.vm.box = 'archlinux/archlinux'
  config.vm.define 'arch_vm'
  config.vm.boot_timeout = 3000

  script = <<-SCRIPT
  pacman -Syu python ansible --noconfirm
  SCRIPT
  config.vm.provision 'shell', inline: script

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'playbook.yml'
    ansible.verbose = 'v'
    ansible.groups = {
      'localhost' => ['arch_vm']
    }
  end
end
