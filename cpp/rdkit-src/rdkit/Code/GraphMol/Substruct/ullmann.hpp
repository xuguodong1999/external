// morpho/cdl/bgl_expansions/algorithms/ullmann.hpp header file//
// Copyright (c) 2003-2008 Vladimir J. Sykora
// Copyright (c) 2007-2008 Vladimir J. Sykora and NCU Studies Ltd
// Modifications by Greg Landrum, January 2009
//
//*****************************************************************************
// Permission is hereby granted, free of charge, to any person or organization
// obtaining a copy of the software and accompanying documentation covered by
// this license (the "Software") to use, reproduce, display, distribute,
// execute, and transmit the Software, and to prepare derivative works of the
// Software, and to permit third-parties to whom the Software is furnished to
// do so, all subject to the following:
//
// The copyright notices in the Software and this entire statement, including
// the above license grant, this restriction and the following disclaimer,
// must be included in all copies of the Software, in whole or in part, and
// all derivative works of the Software, unless such copies or derivative
// works are solely in the form of machine-executable object code generated by
// a source language processor.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
// SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
// FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

//*****************************************************************************

//-----------------------------------------------------------------------------

// Algorithm due to JR Ullmann. "An Algorithm for Subgraph
// Isomorphism". Journal of the Association for
// Computing Machinery, Vol 23, No.1, January 1976, pp 31-42.

#ifndef MORPHO_CDL_BGL_EXP_ULLMANN_HPP
#define MORPHO_CDL_BGL_EXP_ULLMANN_HPP

// -------- boost
#include <boost/numeric/ublas/matrix.hpp>
#include <boost/graph/graph_traits.hpp>
// -------- std
#include <utility>  // for std::pair<>
#include <algorithm>

namespace boost {
namespace detail {

template <class Graph, class UblasMatrix, class BackInsertionSequence,
          class EdgeLabeling>
bool forward_checking(const Graph& g1, const Graph& g2, UblasMatrix& M,
                      size_t count, BackInsertionSequence& F,
                      size_t num_vert_g1, size_t num_vert_g2,
                      EdgeLabeling& edge_labeling) {
  typedef std::pair<typename graph_traits<Graph>::edge_descriptor, bool>
      edge_presence;
  typename BackInsertionSequence::iterator fi, fi_end = F.end();
  for (size_t k = count + 1; k < num_vert_g1; ++k) {
    for (size_t l = 0; l < num_vert_g2; ++l) {
      if (!M(k, l)) continue;
      // check mapping:
      fi = F.begin();
      while (fi != fi_end) {
        bool flag1(0), flag1_1(0), flag2(0), flag2_1(0);
        edge_presence ep1 = edge(k, fi->first, g1);
        if (ep1.second) {
          flag1_1 = true;
          edge_presence ep2 = edge(l, fi->second, g2);
          if (ep2.second) flag1 = edge_labeling(ep1.first, ep2.first);
        }
        if (flag1_1 && flag1) {
          M(k, l) = 1;
          ++fi;
          continue;
        }
        edge_presence ep2 = edge(l, fi->second, g2);
        if (ep2.second) {
          flag2_1 = true;
          ep1 = edge(k, fi->first, g1);
          if (ep1.second) {
            flag2 = edge_labeling(ep1.first, ep2.first);
          } else {
            // ring closed in main structure, not closed in query. This should
            // pass
            flag2 = true;
          }
        }
        if (flag2_1 && flag2) {  // if one edge exists, there must be a mapping
          M(k, l) = 1;
        } else if (!flag1_1 && !flag2_1) {  // or both edges are not present
          M(k, l) = 1;
        } else
          M(k, l) = 0;  // if not, there's no mapping
        ++fi;
      }
    }
  }
  // TODO: change the data structure of the M matrix to sparse matrix. This
  // wouldn't be necessary
  size_t cero_row(0);
  for (size_t k = 0; k < num_vert_g1; ++k) {
    for (size_t l = 0; l < num_vert_g2; ++l) {
      if (M(k, l))
        break;
      else
        ++cero_row;
    }
    if (cero_row == num_vert_g2) return false;  // if there is a cero row
    cero_row = 0;
  }
  return true;
}

template <class Graph, class EdgeLabeling, class UblasMatrix,
          class BackInsertionSequence>
bool backtrack(const Graph& g1, const Graph& g2, size_t count,
               const UblasMatrix& M, BackInsertionSequence& F,
               const size_t num_vert_g1, const size_t num_vert_g2,
               EdgeLabeling& edge_labeling) {
  if (count == num_vert_g1) return true;
  for (size_t i = 0; i < num_vert_g2; ++i) {
    if (M(count, i)) {
      F.push_back(std::make_pair(count, i));
      UblasMatrix M_prime(M);
      for (size_t m = count + 1; m < num_vert_g1; ++m) {
        M_prime(m, i) = 0;
      }

      if (forward_checking(g1, g2, M_prime, count, F, num_vert_g1, num_vert_g2,
                           edge_labeling)) {
        if (backtrack(g1, g2, count + 1, M_prime, F, num_vert_g1, num_vert_g2,
                      edge_labeling)) {
          return true;
        }
      }
      F.erase(std::remove(F.begin(), F.end(), std::make_pair(count, i)),
              F.end());
    }
  }
  return false;
}

template <class Graph, class EdgeLabeling, class UblasMatrix,
          class DoubleBackInsertionSequence>
void backtrack_all(const Graph& g1, const Graph& g2, size_t count,
                   const UblasMatrix& M, DoubleBackInsertionSequence& FF,
                   const size_t num_vert_g1, const size_t num_vert_g2,
                   EdgeLabeling& edge_labeling) {
  if (count == num_vert_g1) return;
  DoubleBackInsertionSequence holdFF;
  holdFF.insert(holdFF.begin(), FF.begin(), FF.end());
  FF.clear();
  for (size_t i = 0; i < num_vert_g2; ++i) {
    if (M(count, i)) {
      DoubleBackInsertionSequence tFF;

      UblasMatrix M_prime(M);
      for (size_t m = count + 1; m < num_vert_g1; ++m) {
        M_prime(m, i) = 0;
      }

      if (holdFF.size()) {
        for (typename DoubleBackInsertionSequence::const_iterator iter =
                 holdFF.begin();
             iter != holdFF.end(); ++iter) {
          typename DoubleBackInsertionSequence::value_type F = *iter;
          F.push_back(std::make_pair(count, i));
          if (forward_checking(g1, g2, M_prime, count, F, num_vert_g1,
                               num_vert_g2, edge_labeling)) {
            tFF.push_back(F);
          }
        }
      } else {
        typename DoubleBackInsertionSequence::value_type F;
        F.push_back(std::make_pair(count, i));
        if (forward_checking(g1, g2, M_prime, count, F, num_vert_g1,
                             num_vert_g2, edge_labeling)) {
          tFF.push_back(F);
        }
      }
      backtrack_all(g1, g2, count + 1, M_prime, tFF, num_vert_g1, num_vert_g2,
                    edge_labeling);
      if (tFF.size()) {
        for (typename DoubleBackInsertionSequence::const_iterator iter =
                 tFF.begin();
             iter != tFF.end(); ++iter) {
          FF.push_back(*iter);
        }
      }
    }
  }
}

template <class Graph, class VertexLabeling  // binary predicate
          ,
          class UblasMatrix>
void prepareM(const Graph& g1, const Graph& g2, VertexLabeling& vertex_labeling,
              UblasMatrix& M) {
  size_t rows(num_vertices(g1));
  size_t cols(num_vertices(g2));
  M.resize(rows, cols);
  // initialize the matrix:
  for (size_t i = 0; i < rows; ++i) {
    for (size_t j = 0; j < cols; ++j) {
      if (out_degree(j, g2) >= out_degree(i, g1) && vertex_labeling(i, j)) {
        M(i, j) = 1;
      } else
        M(i, j) = 0;
    }
  }
}
}  // namespace detail

// test if g1 is a subgraph of g2. mapped vertices are returned in F
// Mapping : first: g1 vertices, second : g2 vertices
// O( num_vertices(g1)! num_vertices(g1) ^ 3 )
// This function doesnt Work with filtered graphs!
// The size of F doesn't indicate match!
template <
    class Graph, class VertexLabeling  // binary predicate
    ,
    class EdgeLabeling  // binary predicate
    ,
    class
    BackInsertionSequence  // contains
                           // std::pair<vertex_descriptor,vertex_descriptor>
    >
bool ullmann(const Graph& g1, const Graph& g2, VertexLabeling& vertex_labeling,
             EdgeLabeling& edge_labeling, BackInsertionSequence& F) {
  typedef ::boost::numeric::ublas::matrix<int> matrix_t;
  size_t rows(num_vertices(g1));
  size_t cols(num_vertices(g2));
  matrix_t M;
  detail::prepareM(g1, g2, vertex_labeling, M);
  size_t count(0);
  return detail::backtrack(g1, g2, count, M, F, rows, cols, edge_labeling);
}

// test if g1 is a subgraph of g2.
// F returns all mappings of g1 in g2. mapping in separate containers
template <class Graph, class VertexLabeling  // binary predicate
          ,
          class EdgeLabeling  // binary predicate
          ,
          class DoubleBackInsertionSequence  // contains a back insertion
                                             // sequence
          >
bool ullmann_all(const Graph& g1, const Graph& g2,
                 VertexLabeling& vertex_labeling, EdgeLabeling& edge_labeling,
                 DoubleBackInsertionSequence& F) {
  typedef ::boost::numeric::ublas::matrix<int> matrix_t;
  size_t rows(num_vertices(g1));
  size_t cols(num_vertices(g2));
  matrix_t M;
  detail::prepareM(g1, g2, vertex_labeling, M);
  size_t count(0);
  detail::backtrack_all(g1, g2, count, M, F, rows, cols, edge_labeling);
  return !F.empty();
}

}  // namespace boost

#endif  // MORPHO_CDL_BGL_EXP_ULLMANN_HPP
