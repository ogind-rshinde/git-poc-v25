# OpenGov Financials Development VM

## Instructions to use the VM
See https://opengovinc.atlassian.net/wiki/spaces/FINENG/pages/1264124165/Financials+VMs+for+Development+and+Testing

## Building the VM
One day we'll compile all the screenshots into instructions. Talk to Jono.

## Finalizing a VM for distribution
Once a VM is ready, it needs to be sanitized and shrunk, removing source code and preparing it with a delightful New User Experience.

- [ ] Review all ignored files (`git status --ignored`) and update the finalize-vm.sh script to preserve the necessary ones (usually only `db2cli.ini` and `cogdmd2.ini`) in the file tree
- [ ] Do a final git pull/push on VM
- [ ] Take a final snapshot of the development VM
- [ ] Shut down
- [ ] Review VM settings one last time
- [ ] Snapshot the development VM as "GM - 2020-06-19"
- [ ] Copy the VM and reopen it
- [ ] Delete all snapshots in the clone
- [ ] Boot and run finalize-vm.sh
- [ ] Shut down
- [ ] Create a final restore snapshot with the date (Factory Reset - 2020-06-19)
- [ ] Compress with max 7Zip compression and the 1P encryption password
- [ ] Test all instructions with this VM
- [ ] Upload to s3://og-financials-developer-vm-unguessable-bucket-name-im-lazy/Financials Development.vmwarevm.7z
