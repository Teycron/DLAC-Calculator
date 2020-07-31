# DLAC-Calculator

## Introduction

This is a calculator which includes the following functionalities.

## Functionalities

- Calculating with negative and positive numbers
- Calculating with comma or point separated numbers
- summation **"+"**
- subtraction **"-"**
- multiplication **"*"**
- division **"/"**
- modulo **"%"**
- power **"^"**
- Check if a number is prime or find the next higher one **"prime(7) -> 7 or prime(14) -> 17"**

## Makefile and Usage

### Compile
To compile the final calculator, use following command:
```
make all
```

### Test
To test the calculator with the included testfile, use following command:
```
make test
```

### Use
To use the calculator, start it with:
```
./calc
```
After starting the calculater you can make different inputs.<br/>
If your inputs are valid, the calculator will give you a computed output. Else the calculator will exit automatically.<br/>
If you want to exit the calculator by a command, use 'e' or 'E' as input.

#### Input
If you don't know how a valid input looks like, take a look at the testfile with the [valid inputs](./testfiles/testfile_valid) and the one with the [invalid inputs](./testfiles/testfile_invalid).
