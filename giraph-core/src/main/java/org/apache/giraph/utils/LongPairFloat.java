/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.giraph.utils;

/**
 * A pair of longs
 */
public class LongPairFloat {
  /** First element. */
  private long first;
  /** Second element. */
  private long second;

  private float val;

  /** Constructor.
   *
   * @param fst First element
   * @param snd Second element
   */
  public LongPairFloat(long fst, long snd, float v) {
    first = fst;
    second = snd;
    val = v;
  }

  /**
   * Get the first element.
   *
   * @return The first element
   */
  public long getFirst() {
    return first;
  }

  /**
   * Set the first element.
   *
   * @param first The first element
   */
  public void setFirst(long first) {
    this.first = first;
  }

  /**
   * Get the second element.
   *
   * @return The second element
   */
  public long getSecond() {
    return second;
  }

  /**
   * Set the second element.
   *
   * @param second The second element
   */
  public void setSecond(long second) {
    this.second = second;
  }


  public void setVal(float v) {
    this.val = v;
  }

  public float getVal() {
    return val;
  }
}
