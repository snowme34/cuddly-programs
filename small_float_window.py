# an small floating window (only tested on windows)
# use right mouse button to move
# esc to quit and close

import tkinter as tk
import tkinter.ttk as ttk
from tkinter import *
#import tkFileDialog

class myApp(tk.Tk):
    def __init__(self):
        tk.Tk.__init__(self)
        self.overrideredirect(True)
        #self.wm_geometry("460x18")
        self.wm_geometry("200x300")
        self.configure(background='white')
        #self.attributes('-transparentcolor', 'white')
        #self.attributes("-alpha", .30)

        label = tk.Label(self, bg='grey')
        #self.lift()
        self.wm_attributes("-topmost", True)
        #self.wm_attributes("-disabled", True)
        #self.wm_attributes("-transparentcolor", "white")
        #label.pack()

        text = Text(self)

        text.insert(INSERT, "YOUR TEXT HERE")
        text.pack(side="top", fill="both", expand=True)

        #self.label = tk.Label(self, text="构图 色彩 结构 完成度 创意 气氛 个人风格 作者人气 TAG 画风流行度")
        #self.label.pack(side="top", fill="both", expand=True)

        #self.grip = ttk.Sizegrip(self)
        #self.grip.place(relx=1.0, rely=1.0, anchor="se")
        #self.grip.lift(self.label)

        self.bind("<ButtonPress-3>", self.StartMove)
        self.bind("<ButtonRelease-3>", self.StopMove)
        self.bind("<B3-Motion>", self.OnMotionMove)

        self.bind("<Escape>", lambda e: e.widget.quit())

        #self.grip.bind("<B1-Motion>", self.OnMotionResize)

    def StartMove(self, event):
        self.x = event.x
        self.y = event.y

    def StopMove(self, event):
        self.x = None
        self.y = None

    def OnMotionMove(self, event):
        deltax = event.x - self.x
        deltay = event.y - self.y
        x = self.winfo_x() + deltax
        y = self.winfo_y() + deltay
        self.geometry("+%s+%s" % (x, y))

    def OnMotionResize(self, event):
        x1 = self.winfo_pointerx()
        y1 = self.winfo_pointery()
        x0 = self.winfo_rootx()
        y0 = self.winfo_rooty()
        self.geometry("%sx%s" % ((x1-x0),(y1-y0)))
        return

app=myApp()
app.mainloop()