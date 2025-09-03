
import { describe, expect, test } from 'vitest'
import { Score } from '../../src/modules/score';

describe('Score', () => {
  const score = new Score

  test('#win', () => {
    expect(score.win()).toBe('hell naw brother grox shit');
  });
});
