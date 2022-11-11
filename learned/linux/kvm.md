# KVMを使って仮想マシンを作ってみる

## 2022-11-08
>KVM (Kernel-based Virtual Machine：カーネルベースの仮想マシン) は、Linux® に組み込まれたオープンソースの仮想化テクノロジーです。具体的には、KVM を使用すると、Linux をハイパーバイザーに変貌させることができます。これによりホストマシンは、ゲストや仮想マシン (VM) と呼ばれる複数の独立した仮想化環境を稼働させることができます。

### 環境

```sh
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 20.04.4 LTS
Release:        20.04
Codename:       focal
```

### memo
- 参考
    - https://wiki.ubuntu.com/kvm?_ga=2.138676339.1509772247.1667917597-1981892648.1667917597
    - https://help.ubuntu.com/community/KVM
    - https://abillyz.com/moco/studies/483

#### 必要なパッケージをインストール

```sh
sudo apt update && sudo apt up grade
sudo apt-get install gcc libsdl1.2-dev zlib1g-dev libasound2-dev linux-kernel-headers pkg-config libpci-dev
sudo apt install libgnutls28-dev
sudo apt install qemu qemu-kvm
sudo apt install virt-manager qemu-system
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER
```

再起動

#### 新しい仮想マシンを作成する

---

エラー

①
```
invoke-rc.d: initscript lvm2-lvmpolld, action "restart" failed.
● lvm2-lvmpolld.service - LVM2 poll daemon
     Loaded: loaded (/lib/systemd/system/lvm2-lvmpolld.service; static; vendor preset: enabled)
     Active: inactive (dead)
       Docs: man:lvmpolld(8)
dpkg: error processing package lvm2 (--configure):
 installed lvm2 package post-installation script subprocess returned error exit status 1
Setting up qemu-system-misc (1:4.2-3ubuntu6.23) ...
Setting up ovmf (0~20191122.bd85bf54-2ubuntu3.3) ...
Setting up seabios (1.13.0-1ubuntu1.1) ...
Setting up cpu-checker (0.7-1.1) ...
Setting up qemu-system-s390x (1:4.2-3ubuntu6.23) ...
Setting up qemu-system-x86 (1:4.2-3ubuntu6.23) ...
Setting up qemu-system (1:4.2-3ubuntu6.23) ...
Processing triggers for man-db (2.9.1-1) ...
Processing triggers for initramfs-tools (0.136ubuntu6.7) ...
update-initramfs: Generating /boot/initrd.img-5.15.0-52-generic
Unsupported platform on EFI system, doing nothing.
Errors were encountered while processing:
 lvm2
E: Sub-process /usr/bin/dpkg returned an error code (1)
```

②
<img width="778" alt="スクリーンショット 2022-11-08 23 53 33" src="https://user-images.githubusercontent.com/71882104/200597078-41f58150-452a-4de8-a137-bd1cf37833fd.png">
---

## 2022-11-09

--
削除して、インストールし直した。

```sh
sudo apt purge lvm2 && sudo apt install lvm2
```

ok

--
ubuntu isoファイルをダウンロードした。
https://ubuntu.com/download/desktop

--

### Create a new virtual machine
- Choose ISO or CDROM install media
  - ダウンロードしたisoファイルを選択する。
- Choose the Operating System you are installing
  - Ubuntu 20.04
- Memory, CPUs, Disk Image, Name
  - とりあえず適当
- Finish
  - 仮想マシンが起動

--

20.04をダウンロード、指定し直す。
https://releases.ubuntu.com/20.04/
https://releases.ubuntu.com/focal/
https://jp.ubuntu.com/download

