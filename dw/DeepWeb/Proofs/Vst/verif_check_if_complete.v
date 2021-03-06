Require Import String.

Require Import DeepWeb.Spec.Swap_CLikeSpec.

From DeepWeb.Spec.Vst
     Require Import MainInit Gprog check_if_complete_spec.

From DeepWeb.Lib
     Require Import VstLib.

From DeepWeb.Proofs.Vst
     Require Import VerifLib.

Set Bullet Behavior "Strict Subproofs".

Lemma body_check_if_complete:
  semax_body Vprog Gprog f_check_if_complete
             (check_if_complete_spec BUFFER_SIZE).
Proof.
  start_function.

  forward_if.
  {
    forward.
    Exists 1.
    entailer!.

    unfold is_complete.
    rewrite Z.eqb_eq.
    autorewrite_sublist.
    unfold BUFFER_SIZE.
    assumption.
  } 

  forward.

  Exists 0.
  entailer!.
  unfold is_complete.
  rewrite <- not_true_iff_false.
  unfold not, BUFFER_SIZE; intros Hsize.
  apply H0.
  revert Hsize.
  autorewrite_sublist.
  rewrite Z.eqb_eq.
  intros; auto.
  
Qed.  