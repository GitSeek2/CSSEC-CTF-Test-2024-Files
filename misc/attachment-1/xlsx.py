import openpyxl

# 创建一个新的工作簿
wb = openpyxl.Workbook()

# 获取第一个工作表
sheet = wb.active
sheet.title = "Sheet1"
flag = "CSSEC{HOPEYOUALLGAYSHAPPYINCSSEC}"
# 要添加的数据
flag = "CSSEC{HOPEYOUALLGAYSHAPPYINCSSEC}"
data = "".join([str(bin(ord(x))[2:].zfill(8)) for x in flag])


# 添加数据到列中，重复30次

for row, value in enumerate(data):
    sheet.cell(row=row+1, column=1, value=value)
    print(row ,value)

# 保存工作簿
wb.save("期末/output.xlsx")
