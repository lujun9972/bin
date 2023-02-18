import csv
import json

def csv_to_json(csv_file_path):
    # 打开csv文件
    with open(csv_file_path, 'r') as csv_file:
        # 使用csv模块读取csv文件内容
        reader = csv.DictReader(csv_file)
        # 将每行数据转换为字典，并添加到列表中
        data = [row for row in reader]
    # 将列表中的字典数据转换为json格式
    json_data = json.dumps(data, indent=2)
    return json_data

# 示例：将csv文件转换为json格式并输出到控制台
csv_file_path = 'your_csv_file.csv'
json_data = csv_to_json(csv_file_path)
print(json_data)
