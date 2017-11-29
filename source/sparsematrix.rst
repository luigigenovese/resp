Sparse Matrix Operations API
=======================

In this file we will put out proposition for the API of the
sparsematrix operations to be performed.
We will profit of this file also to learn the good prectice to create
developer's documentation for the library

Basic types
-----------

.. f:type:: resp/resp_matrix

   Basic entity of the library, represents a Matrix with a defined sparsity level
   Here we list the important attributes that we would like to expose

   :f integer ndummy: Placeholder for some components of the structure we would like to expose

Constructors
------------
We here indicate the basic routines for the construction of the derived types

.. we use autodocumentation here as we would directly like to write the code within f90 sources

.. f:autofunction:: resp_matrix_create

.. f:autofunction:: resp_matrix_set

.. f:autofunction:: resp_matrix_copy

.. f:autofunction:: resp_matrix_destroy

I/O Routines
------------
Here we indicate the basic routines for performing input and output operations.

.. f:autofunction:: resp_matrix_readcheckpoint

.. f:autofunction:: resp_matrix_writecheckpoint

The following two routines are for processing the `Matrix Market Format
<http://math.nist.gov/MatrixMarket/formats.html#MMformat>`_.

.. f:autofunction:: resp_matrix_readmatrixmarket

.. f:autofunction:: resp_matrix_writetomatrixmarket

Conversion Routines
------------
Here we indicate the basic routines for converting a matrix (to and) from
different types.

.. f:autofunction:: resp_matrix_fromtripletlist

Operations
----------
Here we indicate the basic linear algebra routines that can be performed using
a matrix.

.. f:autosubroutine:: resp_axpy

.. f:autosubroutine:: resp_dot

.. f:autosubroutine:: resp_gemm

.. f:autosubroutine:: resp_norm

.. f:autosubroutine:: resp_scal

.. f:autosubroutine:: resp_trace

.. f:autosubroutine:: resp_transpose

Basic Data Access
----------
Here we indicate some helper routines for getting information about the matrix.

.. f:autosubroutine:: resp_matrix_getdescriptor

Scratch Space
----------
(For testing manual documentation)

.. This is the example for a manually documented function
..
.. .. f:function:: yaml_strings/combine_strings
..
.. 	Function that combines two strings
..
.. 	:p char a: First argument
.. 	:p character b: Second argument
..

Example of usage of the library
=======================

In this section we might write some code snippets related on how the proposed API should work
Ideally, the code snippets should be extracted from actual programs that will be used
in the non-regression test of the library (as soon as I figure out how to do that...)
