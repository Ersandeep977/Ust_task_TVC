import os
print('welcome to terrafrom world by sandeep kumar patel')
print('#'*80)
input('do you want to continue Press Enter...for init command')
os.system('terraform init')
print('#'*80)
input('do you want to continue Press Enter...for fmt command')
os.system('terraform fmt')
print('#'*80)
input('do you want to continue Press Enter...for validate command')
os.system('terraform validate')
print('#'*80)
input('do you want to continue Press Enter...for apply command')
os.system('terraform apply -auto-approve')
print('#'*80)
# input('do you want to continue Press Enter  for destroy command')
# os.system('terraform destroy -auto-approve')
# print('#'*80)
print('thank you... backend ready ')
print('plz go used cd .. command for next step')