initData() {
  
  #设置商户状态
  echo "set merchant status ${merchant}"
  setMerchantStatusShell="cleos push action ${otcAccountName} enbmerchant  \"[ '${merchant}' , true ]\" -p admin"
  ssh sh-misc "${remoteDockerScrip} '${setMerchantShell}'"

}


sh ./scripts/deploy/01-unlock.sh
otcAccountName=${1}.o
remoteDockerScrip='docker exec -i mgp-devnet /bin/bash -c'

array=("joss1"
        "chenjunqiang"
        "amaxhu3t3tjd"
        "jason1")
for i in "${array[@]}"; do   # The quotes are necessary here
    merchant=$i
    initData
done