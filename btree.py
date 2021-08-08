
import math

class Node:

	def __init__(self, value = None, index = None, point = None):
		self.value = value
		self.point = point
		self.index = index
		self.parent = None
		self.check_leaf = False

class BplusTree:
	
	def __init__(self, order):
		self.order = order * 2
		self.min = order
		self.root = []
		self.inners = []
		self.leaves = []
		self.check_parent = False

	def bulkLoad(self, entries):
		leaf = self.leafMaker(entries)
		inner = self.innerMaker(leaf)
		root = self.rootMaker(inner)

	def leafMaker(self, entries):
		tempEntries = entries
		tempEntries.sort()
		#leaves = []
		while (tempEntries):
			leaf = []
			for i in range(self.order):
				if (tempEntries):
					leaf.append(tempEntries.pop(0))
				else:
					leaf.append("Null")
			self.leaves.append(leaf)
		return self.leaves

	def innerMaker(self, leaves):
		tempLeaves = leaves[1:len(leaves)]
		full_checker = 0
		ind = 0
		while (tempLeaves):
			inner = []
			for i in range(self.order):
				if (tempLeaves):
					temp = tempLeaves.pop(0)
					newNode = Node(temp[0], ind, self.leaves[ind])
					inner.append(newNode)
					full_checker += 1
					ind += 1
				else:
					newNode = Node("Null", inner[len(inner) - 1].index)
					newNode.point = inner[len(inner) - 1].point
					inner.append(newNode)
			self.inners.append(inner)
		self.isoverfactor(full_checker)
		return self.inners

	def rootMaker(self, inners):
		if (self.check_parent and len(inners) > 1):
			for j in range(self.order):
				for i in range(len(inners) - 1):
					if (inners[i][self.order - 1].value != "Null"):
						newNode = Node(inners[i][self.order - 1].value, i)
						newNode.point = inners[i]
						inners[i][self.order - 1].value = "Null"
						inners[i][self.order - 1].point = inners[i][self.order - 2].point
						inners[i][self.order - 1].index = inners[i][self.order - 2].index
						self.root.append(newNode)
			if (len(inners) > 1):
				blank = len(self.root) - 1
				while (len(self.root) < self.order):
					self.root.append(Node("Null", blank, self.root[blank].point))
		else:
			for i in range(len(inners[0])):
				self.root.append(inners[0][i])
			self.check_parent = False


	def isoverfactor(self, counter):
		factor = round((len(self.inners) * self.order) * 0.5)
		if counter > factor:
			self.check_parent = True

	def search(self, target):
		if (self.check_parent):
			for i in range(len(self.root)):
				if (self.root[i].value == "Null" or (i == len(self.root) - 1 
					and target >= self.root[i].value)):
					indexfromroot = self.root[i].index + 1
					for j in range(len(self.inners[indexfromroot])):
						if (self.inners[indexfromroot][j].value == "Null" or 
							(j == len(self.inners[indexfromroot]) - 1 and 
								target >= self.inners[indexfromroot][j].value)):
							index = self.inners[indexfromroot][j].index + 1
							if (self.targetchecker(target, self.leaves[index])):
								print("\ntarget found at: " + str(self.leaves[index]))
								return self.leaves[index]
							else:
								break
						elif (target < self.inners[indexfromroot][j].value):
							if (self.targetchecker(target, self.inners[indexfromroot][j].point)):
								print("\ntarget found at: " + str(self.inners[indexfromroot][j].point))
								return self.inners[indexfromroot][j].point
							else:
								break
				elif (target < self.root[i].value):
					targetinner = self.root[i].point
					for j in range(len(targetinner)):
						if (targetinner[j].value == "Null" or (j == len(targetinner) - 1 
							and target >= targetinner[j].value)):
							index = targetinner[j].index + 1
							if (self.targetchecker(target, self.leaves[index])):
								print("\ntarget found at: " + str(self.leaves[index]))
								return self.leaves[index]
							else:
								break
						elif (target < targetinner[j].value):
							if (self.targetchecker(target, targetinner[j].point)):
								print("\ntarget found at: " + str(targetinner[j].point))
								return targetinner[j].point
							else:
								break
		else:
			for i in range(len(self.root)):
				if (self.root[i].value == "Null" or (i == len(self.root) - 1 and target >= self.root[i].value)):
					ind = self.root[i].index + 1
					if (self.targetchecker(target, self.leaves[ind])):
						print("\ntarget found at: " + str(self.leaves[ind]))
						return self.leaves[ind]
					else:
						break
				elif (target < self.root[i].value):
					if (self.targetchecker(target, self.root[i].point)):
						print("\ntarget found at: " + str(self.root[i].point))
						return self.root[i].point
					else:
						break
		print("\nData entry not exist")

	def targetchecker(self, target, leaf):
		if target in leaf:
			return True

	def update(self, current, new):
		targetlist = self.search(current)
		if (self.search(new)):
			print("This enrty alreay exist\n"
				"Please enter another entry\n")
			return 
		if targetlist != None and current in targetlist:
			print("update possible")
			for i in range(len(targetlist)):
				if targetlist[i] == current:
					targetlist[i] = new
			self.root = []
			self.inners = []
			newentry = self.entrymakter()
			self.leaves = []
			leaf = self.leafMaker(newentry)
			inner = self.innerMaker(self.leaves)
			root = self.rootMaker(inner)
		else:
			print("Not able to Update")

	def insert_from_root(self, add):
		targetlist = self.search(add)
		if (targetlist):
			print("This enrty alreay exist")
			return 
		for i in range(len(self.root)):
			if (self.root[i].value == "Null" or (i == len(self.root) - 1 and add >= self.root[i].value)):
				ind = self.root[i].index + 1
				if "Null" in self.leaves[ind]:
					for i in range(len(self.leaves[ind])):
						if self.leaves[ind][i] == "Null":
							self.leaves[ind][i] = add
							return 
				else:
					self.addhandler(ind, add)
					return 
			elif (add < self.root[i].value):
				targetlist = self.root[i].point
				ind = self.root[i].index
				if "Null" in targetlist:
					for i in range(len(targetlist)):
						if targetlist[i] == "Null":
							targetlist[i] = add
							return 
				else:
					self.addhandler(ind, add)
					return 
	def reorder(self, newOrder, entry):
		self.__init__(newOrder)
		self.bulkLoad(entry)

	def addhelper(self, temp, newleaf, index):
		self.leaves[index] = temp
		self.leaves.insert(index + 1, newleaf)
		self.root = []
		self.inners = []
		inner = self.innerMaker(self.leaves)
		root = self.rootMaker(inner)

	def inser_from_inner(self, add):
		targetlist = self.search(add)
		if (targetlist):
			print("This enrty alreay exist")
			return 
		for i in range(len(self.root)):
			if (self.root[i].value == "Null" or (i == len(self.root) - 1 
				and add >= self.root[i].value)):
				indexfromroot = self.root[i].index + 1
				for j in range(len(self.inners[indexfromroot])):
					if (self.inners[indexfromroot][j].value == "Null" or 
						(j == len(self.inners[indexfromroot]) - 1 and 
							add >= self.inners[indexfromroot][j].value)):
						ind = self.inners[indexfromroot][j].index + 1
						if "Null" in self.leaves[ind]:
							for i in range(len(self.leaves[ind])):
								if self.leaves[ind][i] == "Null":
									self.leaves[ind][i] = add
									return 
						else:
							self.addhandler(ind, add)
							return 
					elif (add < self.inners[indexfromroot][j].value):
						targetlist = self.inners[indexfromroot][j].point
						ind = self.inners[indexfromroot][j].index
						if "Null" in targetlist:
							for i in range(len(targetlist)):
								if targetlist[i] == "Null":
									targetlist[i] = add
									return 
						else:
							self.addhandler(ind, add)
							return 
			elif (add < self.root[i].value):
				targetinner = self.root[i].point
				for j in range(len(targetinner)):
					if (targetinner[j].value == "Null" or (j == len(targetinner) - 1 
						and add >= targetinner[j].value)):
						ind = targetinner[j].index + 1
						if "Null" in self.leaves[ind]:
							for i in range(len(self.leaves[ind])):
								if self.leaves[i] == "Null":
									self.leaves[i] = add
									return 
						else:
							self.addhandler(ind, add)
							return 
					elif (add < targetinner[j].value):
						targetlist = targetinner[j].point
						ind = targetinner[j].index
						if "Null" in targetlist:
							for i in range(len(targetlist)):
								if targetlist[i] == "Null":
									targetlist[i] = add
									return
						else:
							self.addhandler(ind, add)
							return 
	def addhandler(self, ind, add):
		indexcount = add
		new = []
		intrange = int(self.order * 0.5)
		for i in range(ind, len(self.leaves)):
			if (i == len(self.leaves) - 1) and (indexcount != "Null") :
				for j in range(intrange):
					temp = self.leaves[i][j]
					self.leaves[i][j] = indexcount
					indexcount = temp
					new.append(indexcount)
				for j in range(intrange, self.order):
					temp = self.leaves[i][j]
					self.leaves[i][j] = "Null"
					indexcount = temp
					new.append(indexcount)
				self.leaves.append(new)
			elif (i == len(self.leaves) - 1) and (indexcount == "Null"):
				break
			else:
				for j in (range(self.order)):
					if (indexcount < self.leaves[i][j]):
						temp = self.leaves[i][j]
						self.leaves[i][j] = indexcount
						indexcount = temp
		self.root = []
		self.inners = []
		inner = self.innerMaker(self.leaves)
		root = self.rootMaker(inner)

	def delete_from_root(self, add):
		if (not self.search(add)):
			print("This enrty not exist")
			return 
		for i in range(len(self.root)):
			if (self.root[i].value == "Null" or (i == len(self.root) - 1 and add >= self.root[i].value)):
				ind = self.root[i].index + 1
				self.deletehandler(ind, add)
				return 
			elif (add < self.root[i].value):
				targetlist = self.root[i].point
				ind = self.root[i].index
				self.deletehandler(ind, add)
				return

	def delete_from_inner(self, add):
		targetlist = self.search(add)
		if (not targetlist):
			print("This enrty not exist")
			return 
		for i in range(len(self.root)):
			if (self.root[i].value == "Null" or (i == len(self.root) - 1 
				and add >= self.root[i].value)):
				indexfromroot = self.root[i].index + 1
				for j in range(len(self.inners[indexfromroot])):
					if (self.inners[indexfromroot][j].value == "Null" or 
						(j == len(self.inners[indexfromroot]) - 1 and 
							add >= self.inners[indexfromroot][j].value)):
						ind = self.inners[indexfromroot][j].index + 1
						self.deletehandler(ind, add)
						return 
					elif (add < self.inners[indexfromroot][j].value):
						targetlist = self.inners[indexfromroot][j].point
						ind = self.inners[indexfromroot][j].index	
						self.deletehandler(ind, add)
						return 
			elif (add < self.root[i].value):
				targetinner = self.root[i].point
				for j in range(len(targetinner)):
					if (targetinner[j].value == "Null" or (j == len(targetinner) - 1 
						and add >= targetinner[j].value)):
						ind = targetinner[j].index + 1
						self.deletehandler(ind, add)
						return 
					elif (add < targetinner[j].value):
						targetlist = targetinner[j].point
						ind = targetinner[j].index
						self.deletehandler(ind, add)
						return 

	def deletehandler(self, ind, delete):
		nullpoint = None
		temp = 0
		checker = False
		for i in range(ind, len(self.leaves)):
			nullcounter = 0
			if (i == len(self.leaves) - 1):
				for j in range(self.order):
					if (delete == self.leaves[i][j] and j == self.order - 1):
						self.leaves[i][j] = "Null"
						break;
					elif (delete == self.leaves[i][j] and j != self.order - 1):
						if (self.leaves[i][j + 1] == "Null"):
							nullcounter += 1
						self.leaves[i][j] = self.leaves[i][j + 1]
						checker = True
					else:
						if (self.leaves[i][j] == "Null"):
							nullcounter += 1
							if (nullcounter == self.order):
								self.leaves.pop()
								break
						if (checker or j == self.order - 1):
							self.leaves[i][j] = "Null"
						if (j != self.order - 1):
							self.leaves[i][j] = self.leaves[i][j + 1]
							if (self.leaves[i][j + 1] == "Null"):
								nullcounter += 1
						if (nullpoint != None and j == self.order - 1):
							self.leaves.pop(nullpoint)
			else:
				for j in range(self.order):
					if (j != self.order - 1):
						if (delete == self.leaves[i][j]):
							self.leaves[i][j] = self.leaves[i][j + 1]	
						elif (i != ind):
							if(self.leaves[i][j + 1] == "Null"):
								nullcounter += 1
							self.leaves[i][j] = self.leaves[i][j + 1]
						else:
							if(self.leaves[i][j + 1] == "Null"):
								nullcounter += 1
					else:
						if (delete == self.leaves[i][j]):
							self.leaves[i][j] = self.leaves[i + 1][0]	
						else:
							if (self.leaves[i][j] == "Null"):
								nullcounter += 1
								if (nullcounter == self.order):
									nullpoint = i
									break
							self.leaves[i][j] = self.leaves[i + 1][0] 

		self.root = []
		self.inners = []
		inner = self.innerMaker(self.leaves)
		root = self.rootMaker(inner)
	def entrymakter(self):
		newEntry = []
		for i in self.leaves:
			for j in range(self.order):
				newEntry.append(i[j])
		return newEntry


def prettyprint(bpt, order):
	rootval = []
	innerval = []
	leafval = ""
	if (len(bpt.inners) == 1):
		for i in range(len(bpt.root)):
			rootval.append(str(bpt.root[i].value))
		print("\n        " + str(rootval))
		for i in range(len(bpt.leaves)):
			leafval = leafval + str(bpt.leaves[i]) + "  "
		print("\n" + str(leafval))
	else:
		for i in range(len(bpt.root)):
			rootval.append(str(bpt.root[i].value))
		print("\n         " + str(rootval))
		for i in range(len(bpt.inners)):
			temp = []
			for j in range(len(bpt.inners[i])):
				temp.append(bpt.inners[i][j].value)
			innerval.append(temp)
		print("\n   " + str(innerval))
		for i in range(len(bpt.leaves)):
			leafval = leafval + str(bpt.leaves[i]) + "  "
		print("\n" + str(leafval))



def show_menu():
    print("\nMenu \n"
          "1.Search \n"
          "2.Insert \n"
          "3.Delete \n"
          "4.Update \n"
          "5.Change tree Order \n"
          "6.Exit \n")
try:
	order = int(input("Enter order of the tree: "))
	entries = (input("Enter data entries(ex: 1, 2, 3, 4...): "))
except:
	print("Invalid Input")
record_len = order
bpt = BplusTree(record_len)
bpt.bulkLoad(list(entries))
prettyprint(bpt, order * 2)
option = 0
while option != 6:
    if option == 1:
    	try:
    		target = int(input("Enter data entry: "))
    		bpt.search(target)
    	except:
    		print("Invalid Input")
    elif option == 2:
    	try: 
    		add_data = int(input("Enter data entry: "))
    	except:
    		print("Invalid Input")
        if (bpt.check_parent):
        	bpt.inser_from_inner(add_data)
        else:
        	bpt.insert_from_root(add_data)
        prettyprint(bpt, order * 2)
    elif option == 3:
    	try:
    		delete_data = int(input("Enter data entry: "))
    	except:
    		print("Invalid Input")
    	if (bpt.check_parent):
        	bpt.delete_from_inner(delete_data)
        else:
        	bpt.delete_from_root(delete_data)
        prettyprint(bpt, order * 2)
    elif option == 4:
    	try:
    		cur_data = int(input("Enter the current data entry: "))
    		new_data = int(input("Enter new data entry: "))
    	except:
    		print("Invalid Input")
        bpt.update(cur_data, new_data)
        prettyprint(bpt, order * 2)
    elif option == 5:
    	try:
    		newOrder = int(input("Enter the new order of the tree: "))
    	except:
    		print("Invalid Input")
    	bpt.entrymakter()
    	bpt.reorder(newOrder, bpt.entrymakter())
       	prettyprint(bpt, newOrder * 2)
    elif option == 6:
    	break

    show_menu()
    try:
    	option = int(input("Select one option from the menu: "))
    except:
    	print("Invalid Input")
	


















