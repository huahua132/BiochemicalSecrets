// Copyright Epic Games, Inc. All Rights Reserved.

#include "GameFeaturePackerEditor.h"
#include "Slate/SGameFeaturePackageWidget.h"

#define LOCTEXT_NAMESPACE "FGameFeaturePackerEditorModule"

void FGameFeaturePackerEditorModule::StartupModule()
{
	FHotPatcherModBaseModule::StartupModule();
}

void FGameFeaturePackerEditorModule::ShutdownModule()
{
	FHotPatcherModBaseModule::ShutdownModule();
}

FHotPatcherModDesc FGameFeaturePackerEditorModule::GetModDesc() const
{
	FHotPatcherModDesc TmpModDesc;
	TmpModDesc.ModName = MOD_NAME;
	TmpModDesc.CurrentVersion = MOD_VERSION;
	TmpModDesc.bIsBuiltInMod = IS_INTERNAL_MODE;
	TmpModDesc.MinHotPatcherVersion = 80.0f;
	TmpModDesc.Description = TEXT("Plugin/GameFeature Packager");
	TmpModDesc.URL = TEXT("https://imzlp.com/posts/17658/");
	TmpModDesc.UpdateURL = TEXT("https://github.com/hxhb/HotPatcher/Mods/GameFeaturePacker");
	TArray<FHotPatcherActionDesc> ActionDescs;
	TmpModDesc.ModActions.Emplace(
		TEXT("Patcher"),MOD_NAME,TEXT("ByGameFeature"), TEXT("Create an Game Feature Package."),
		CREATE_ACTION_WIDGET_LAMBDA(SGameFeaturePackageWidget,TEXT("ByGameFeature")),0
		);
	return TmpModDesc;
}

#undef LOCTEXT_NAMESPACE
	
IMPLEMENT_MODULE(FGameFeaturePackerEditorModule, GameFeaturePackerEditor)