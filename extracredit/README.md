# External Sorting : implementing a B+ tree index. 

# B+ Tree Index 

## Program Input 

1. The order of the tree 

2. The data entries of the tree 

3. Create the new B+ tree index using the bulk loading method, and print the tree. 

4. Show menu with all the operations allowed in the tree

## Program Output 

Depending on the operation selected by the user, print the following

1. Search: if the data entry was found, print the tree with the appropiate message (see example below). Otherwise, print "data entry not found".

2. Insert: Print the tree after inserting the new data entry. 

3. Delete: Print the tree after deleting the existing data entry. If the data to be deleted does not exist, print the correspondent message. 

4. Update: Print the tree after updating an existing value. 

5. Change Tree Order: Print the three after changing the order. 

Px are the pointers pointing to that node from the parent node. For example, in the first tree, 1,5(p0) means that pointer 0 from the non-leaf node 12,NULL is pointing to the leaf node 1,5. Note that pointer 0 is always the first pointer of a non-leaf node starting from the most left one.

```python
Enter order of the tree: 1
Enter data entries: 12, 32, 1, 35, 87, 24, 78, 47, 89, 5

          [||32||NULL||]   

 [||12||NULL||]       [||47||87||]   

[ 1 5] [ 12 24] [ 32 35] [ 47 78] [ 87 89]  
 
Menu: 
1.Search
2.Insert
3.Delete
4.Update
5.Change Tree Order
6.Exit
 
Select an option: 1
Enter data entry: 89
[ 87 89]

Menu: 
1.Search
2.Insert
3.Delete
4.Update
5.Change Tree Order
6.Exit

Select an option: 2
Enter data entry: 33

                 [||32||78||]   

[||12||NULL||]   [||35||NULL||]   [||87||NULL||]   

[ 1 5] [ 12 24] [ 32 33] [ 35 47] [ 78 NULL] [ 87 89] 


Menu: 
1.Search
2.Insert
3.Delete
4.Update
5.Change Tree Order
6.Exit

Select an option: 3
Enter data entry: 35

          [||32||NULL||]   

[||12||NULL||]        [||47||87||]   

[ 1 5] [ 12 24] [ 32 33] [ 47 78] [ 87 89] 


Menu: 
1.Search
2.Insert
3.Delete
4.Update
5.Change Tree Order
6.Exit

Select an option: 4
Enter the current data entry: 47
Enter new data entry: 48

          [||32||NULL||]   

 [||12||NULL||]       [||48||87||]   

[ 1 5] [ 12 24] [ 32 33] [ 48 78] [ 87 89] 


Menu: 
1.Search
2.Insert
3.Delete
4.Update
5.Change Tree Order
6.Exit

Select an option: 5
Enter the new order of the tree: 2

        [||32||87||NULL||NULL||]   

[ 1 5 12 24] [ 32 33 48 78] [ 87 89 NULL NULL] 


Menu: 
1.Search
2.Insert
3.Delete
4.Update
5.Change Tree Order
6.Exit

```