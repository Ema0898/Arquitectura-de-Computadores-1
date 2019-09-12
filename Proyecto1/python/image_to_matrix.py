from PIL import Image

f= open("image.txt","w+")

img = Image.open('image.png').convert('L')  # convert image to 8-bit grayscale
WIDTH, HEIGHT = img.size

data = list(img.getdata()) # convert image data to a list of integers
# convert that to 2D list (list of lists of integers)
data = [data[offset:offset+WIDTH] for offset in range(0, WIDTH*HEIGHT, WIDTH)]

# At this point the image's pixels are all in memory and can be accessed
# individually using data[row][col].

c=0

for i in range(480):
    for j in range(640):
        
        f.write(format(c, 'x')+":"+"\t"+format(data[i][j],'08b')+";"+"\n")
        c+=1


f.close() 




